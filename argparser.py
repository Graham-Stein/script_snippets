"""
Example of argparser, see also
    - https://docs.python.org/3/library/argparse.html
    - https://docs.python.org/3/howto/argparse.html
"""
import argparse
import logging
import sys
from datetime import datetime


def validate_date_format(input_date: str) -> bool:
    """
    Args:
        input_date (str): YYYY/MM/DD
    Returns:
        The date string if format is validated or raises ArgumentTypeError
    """
    format = "%Y/%m/%d"
    try:
        bool(datetime.strptime(input_date, format))
    except ValueError:
        logging.error("--date {input_date} is not in the required YYYY/MM/DD format")
        msg = f"--date {input_date} is not in the required YYYY/MM/DD format."
        raise argparse.ArgumentTypeError(msg)
    return input_date


class Parser:
    """
    Handle parsing of command line arguments
    """

    @staticmethod
    def get_args(argv: list) -> argparse.ArgumentParser:
        parser = argparse.ArgumentParser(
            description="CLI to load data from S3, process and save to S3"
        )
        parser.add_argument(
            "--date",
            metavar="-d",
            dest="_date",
            type=validate_date_format,
            help="<YYYY/MM/DD>",
            required=True,
        )
        parser.add_argument(
            "--initials", metavar="-i", help="Your initials", type=str, required=True
        )
        return parser.parse_args(argv)

def main(argv: list) -> None:
    """
    Parse arguments from command line
    Then handle the task
    """
    # Parse args
    args = Parser.get_args(argv)
    _date = args._date
    initials = args.initials

    # handle task
    print(f"DATE: {_date}")
    print(f"INITIALS: {initials}")
    

if __name__ == "__main__":
    main(sys.argv[1:])