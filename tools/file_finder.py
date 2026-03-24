from pathlib import Path

print("Please enter a file type to seach: (ex:.py, .csv, .sh)")
user_input = input()
validated_input = user_input.startswith(".")

if validated_input:
    print(f"Searching for all {user_input} files ....")
else:
    print(f"{user_input} does not match supported file types.")
    exit()

home_dir = Path.home()
print(f"Searching for matching files in {home_dir}.....\n")

pattern = (f"*{user_input}")

all_files = list(home_dir.rglob(f"{pattern}"))

if all_files:
    print(f"There are {len(all_files)} files matching {user_input}\n")
    print("Press 1 to list file name only\nPress 2 to list full file paths")
    user_request = input()
    if int(user_request) == 1:
        for file in all_files:
            print(file.name)
    elif int(user_request) == 2:
        for file in all_files:
            print(file)
    else:
        print("Invalid option..")

else:
    print(f"There or 0 files matching {user_input}")

