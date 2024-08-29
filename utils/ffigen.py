###
### THIS NEEDS AN EXTREME OPTIMIZATION HERE OR WRITING THAT IN GLEAM
### THIS IS pl: ULEP
###

import re
import os
import requests
import zipfile
import io


def parse_erlang_function(erlang_code, modulename, app_name):
    pattern = r"(\w+)\s*\((.*?)\)\s*->"
    matches = re.findall(pattern, erlang_code)
    raw_fcs = []

    for match in matches:
        if match[1] == "":
            print(f"{match[0]}/0")
            raw_fcs.append({
                'name': match[0],
                'arity': 0,
            })

        a = match[1].split(",")
        w_fl = False
        for e in a:
            if any(char in e for char in "[]|:\'<$>{}"):
                w_fl = True
                break
        if w_fl:
            continue

        raw_fcs.append({
            'name': match[0],
            'arity': len(a),
        })

    mangling_dct = {}
    name_arity = set()
    for element in raw_fcs:
        name_arity.add(f"{element['name']}/{element['arity']}")
    


    with open(f'rosetta_ffi_{app_name}_{modulename}_otp27.gleam', 'w') as f:
        f.write("////// THIS FILE WAS CREATED BY ROSETTA FFIGEN \n")
        f.write("////// THERE IS ABSOLUTELY NO WARRANTY THAT THOSE NAMES WILL BE THE SAME IN THE NEWER VERSIONS OF THE LIBRARY \n")
        f.write("////// \n")
        f.write("////// PLEASE DO NOT USE FUNCTIONS FROM THIS MODULE DIRECTLY; THOSE ARE ONLY FOR REFERENCE ONLY \n")
        f.write("////// \n")

        for element in name_arity:
           
            function_name = element
            arity = int(element.split("/")[1])
            function_name = element.split("/")[0]
            clear_name = function_name

            args = [f"arg{x}: Dynamic" for x in range(arity)] if arity != 0 else []
            f.write(f"/// {modulename}:{function_name}\n")
            f.write(f"/// {function_name} to ext_erl_ffigen_{modulename}_{clear_name.lower()}_{arity} binding generated automatically by rosettaffigen \n")
            f.write(f"/// This function IS NOT DESIGNED for general use.\n")
            f.write(f'@external(erlang, "{modulename}", "{clear_name}")\n')
            f.write(f"pub fn ext_erl_ffigen_app_{app_name}_{modulename}_{clear_name.lower()}_{arity} ({','.join(args)}) -> Dynamic\n\n")


def main():
    OTP_URI = "https://github.com/erlang/otp/archive/refs/tags/OTP-27.0.1.zip"
    erlang_folder = "ffigen_erl"
    otp_src_folder = "otp_src"

    if not os.path.exists(erlang_folder):
        os.makedirs(erlang_folder)

    # Uncomment the following block if you want to download and extract OTP
    # if not os.path.exists(otp_src_folder):
    #     response = requests.get(OTP_URI)
    #     if response.status_code == 200:
    #         with zipfile.ZipFile(io.BytesIO(response.content)) as zip_ref:
    #             zip_ref.extractall(erlang_folder)
    #             zip_ref.extractall(otp_src_folder)
    #         print(f"Successfully downloaded and extracted OTP to {erlang_folder} and {otp_src_folder}")
    #     else:
    #         print(f"Failed to download OTP. Status code: {response.status_code}")
    # else:
    #     print(f"OTP already downloaded and extracted in {otp_src_folder}")

    otp_src_path = os.path.join(otp_src_folder, os.listdir(otp_src_folder)[0])
    lib_path = os.path.join(otp_src_path, 'lib')
    
    if os.path.exists(lib_path):
        available_apps = os.listdir(lib_path)
        print("Available apps in the OTP lib folder:")
        for app in available_apps:
            print(f"- {app}")
    else:
        print("Lib folder not found in the OTP source.")
        return

    for app in available_apps:
        app_path = os.path.join(lib_path, app, 'src')
        if os.path.exists(app_path):
            for filename in os.listdir(app_path):
                if filename.endswith(".erl"):
                    file_path = os.path.join(app_path, filename)
                    with open(file_path, "r") as f:
                        erlang_code = f.read()
                    
                    module_name = os.path.splitext(filename)[0]
                    parse_erlang_function(erlang_code, module_name, app)
    



if __name__ == "__main__":
    main()