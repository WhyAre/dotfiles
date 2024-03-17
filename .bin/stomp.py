# Adapted from: https://github.com/vEnhance/dotfiles/blob/main/py-scripts/stomp.py

import argparse
import subprocess
import sys
from pathlib import Path

TERM_COLOR: dict[str, str] = {}
TERM_COLOR["NORMAL"] = ""
TERM_COLOR["RESET"] = "\033[m"
TERM_COLOR["BOLD"] = "\033[1m"
TERM_COLOR["RED"] = "\033[31m"
TERM_COLOR["GREEN"] = "\033[32m"
TERM_COLOR["YELLOW"] = "\033[33m"
TERM_COLOR["BLUE"] = "\033[34m"
TERM_COLOR["MAGENTA"] = "\033[35m"
TERM_COLOR["CYAN"] = "\033[36m"
TERM_COLOR["BOLD_RED"] = "\033[1;31m"
TERM_COLOR["BOLD_GREEN"] = "\033[1;32m"
TERM_COLOR["BOLD_YELLOW"] = "\033[1;33m"
TERM_COLOR["BOLD_BLUE"] = "\033[1;34m"
TERM_COLOR["BOLD_MAGENTA"] = "\033[1;35m"
TERM_COLOR["BOLD_CYAN"] = "\033[1;36m"
TERM_COLOR["BG_RED"] = "\033[41m"
TERM_COLOR["BG_GREEN"] = "\033[42m"
TERM_COLOR["BG_YELLOW"] = "\033[43m"
TERM_COLOR["BG_BLUE"] = "\033[44m"
TERM_COLOR["BG_MAGENTA"] = "\033[45m"
TERM_COLOR["BG_CYAN"] = "\033[46m"

parser = argparse.ArgumentParser(
    "stomp",
    description="Stomps on your work. A C++/Py3 grader for comp programming.",
)
parser.add_argument(
    "program_path",
    help="The C++/Py3 program that you're going to use.",
)
parser.add_argument(
    "-o",
    "--stdout",
    help="Show stdout",
    action="store_true",
)
parser.add_argument(
    "-e",
    "--stderr",
    help="Show stderr (for debugging)",
    action="store_true",
)

opts = parser.parse_args()
if opts.program_path.endswith(".py"):
    PROGRAM_TYPE = "PYTHON"
elif opts.program_path.endswith(".cpp"):
    PROGRAM_TYPE = "C++"
else:
    raise ValueError(f"stomp doesn't support {opts.program_path} yet")


if PROGRAM_TYPE == "C++":
    print("Compiling C++ code...")

    if Path("./Makefile").exists():
        compile_command = ["make"]
    else:
        compile_command = [
            "g++",
            "-Wall",
            "-Wextra",
            "-DDEBUG",
            opts.program_path,
        ]
    compile_process = subprocess.run(compile_command)
    if compile_process.returncode != 0:
        print(f"{TERM_COLOR['BOLD_YELLOW']} COMPILATION FAILED{TERM_COLOR['RESET']}")
        sys.exit(1)
    else:
        print("Compilation OK")
elif PROGRAM_TYPE == "PYTHON":
    print("Python programs don't need compilers haha")
else:
    raise ValueError(f"Invalid program type {PROGRAM_TYPE}")

any_failed = False
for input_file_path in sorted(Path("tests").glob("*.input")):
    stdout_path = input_file_path.with_suffix(".stdout")
    stderr_path = input_file_path.with_suffix(".stderr")
    answer_path = input_file_path.with_suffix(".answer")

    print(f"{TERM_COLOR['BOLD_CYAN']}{input_file_path}{TERM_COLOR['RESET']}")
    with (
        open(input_file_path) as input_file,
        open(stdout_path, "w") as stdout_file,
        open(stderr_path, "w") as stderr_file,
    ):
        if PROGRAM_TYPE == "C++":
            process = subprocess.run(
                ["./a.out"],
                stdin=input_file,
                stdout=stdout_file,
                stderr=stderr_file,
            )
        elif PROGRAM_TYPE == "PYTHON":
            process = subprocess.run(
                ["python", opts.program_path],
                stdin=input_file,
                stdout=stdout_file,
                stderr=stderr_file,
            )
        else:
            raise ValueError(f"Invalid program type {PROGRAM_TYPE}")
    if opts.stderr:
        print(TERM_COLOR["YELLOW"], end="")
        with open(stderr_path) as stderr_file:
            print("\t" + "\t".join(stderr_file.readlines()), end="")
        print(TERM_COLOR["RESET"], end="")
    if opts.stdout:
        with open(stdout_path) as stdout_file:
            lines = stdout_file.readlines()
            if any(line.strip() for line in lines):
                print("\t" + "\t".join(lines), end="")

    if process.returncode != 0:
        print(
            f"\t{TERM_COLOR['BOLD_RED']}CRASHED{TERM_COLOR['RESET']} "
            f"{input_file_path}: return-code={process.returncode}"
        )
        any_failed = True
    elif not answer_path.exists():
        if not any_failed:
            print(f"\tSaving {answer_path} since no existing answer was given")
            subprocess.call(["cp", stdout_path, answer_path])
        else:
            print(f"\t{answer_path} doesn't exist")
    else:
        diff_process = subprocess.run(
            ["diff", "--color=always", stdout_path, answer_path],
            capture_output=True,
        )
        if diff_process.returncode == 0:
            print(
                f"\t{TERM_COLOR['BOLD_GREEN']}PASSED{TERM_COLOR['RESET']} "
                f"test case {input_file_path}"
            )
        else:
            print(diff_process.stdout.decode().strip())
            print(
                f"\t{TERM_COLOR['BOLD_RED']}FAILED{TERM_COLOR['RESET']} "
                f"test case {input_file_path}"
            )
            any_failed = True
    if opts.stdout or opts.stderr:
        print("-" * 60)

