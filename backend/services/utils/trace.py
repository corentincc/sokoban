from datetime import datetime


BOLD = "\033[1m"
CYAN = "\033[36m"
RESET = "\033[0m"


def info(message: str):
    state = f"{BOLD}{CYAN}INFO{RESET}"
    date = datetime.now().strftime("%b-%d-%Y %H:%M:%S")
    print(f"{state}:     [{date}]: {message}")
