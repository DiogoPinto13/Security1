#!/usr/bin/env python3

import sys
import pyotp

# Path to the file where user OTP secrets are stored
SECRETS_FILE = "/etc/openvpn/user_secrets.txt"

def load_secrets():
    """Load user OTP secrets from the file into a dictionary."""
    secrets = {}
    try:
        with open(SECRETS_FILE, "r") as f:
            for line in f:
                user, secret = line.strip().split(":")
                secrets[user] = secret
    except FileNotFoundError:
        print("ERROR: Secrets file not found")
        sys.exit(1)
    return secrets

def verify_otp(username, otp_code):
    """Verify the OTP code for the given user."""
    secrets = load_secrets()
    if username not in secrets:
        return False
    
    totp = pyotp.TOTP(secrets[username])
    return totp.verify(otp_code)

def main():
    """Main function to read input and verify the OTP."""
    if len(sys.argv) != 3:
        print("ERROR: Invalid number of arguments")
        sys.exit(1)
    
    username = sys.argv[1]
    otp_code = sys.argv[2]

    if verify_otp(username, otp_code):
        print("nice")
        sys.exit(0)  # Success
    else:
        print("shit")
        sys.exit(1)  # Failure

if __name__ == "__main__":
    main()
