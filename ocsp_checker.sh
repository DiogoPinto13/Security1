# # #!/bin/bash

# # # Change this to your OCSP responder's address
# # OCSP_SERVER="http://127.0.0.1:8081"

# # # Certificate to check
# # CERT=$1
# # CA_CERT="/etc/openvpn/ca.crt"

# # if [ -z "$CERT" ]; then
# #     echo "Usage: $0 <certificate.pem>"
# #     exit 1
# # fi

# # # Check OCSP status
# # openssl ocsp -issuer "$CA_CERT" -cert "$CERT" -url "$OCSP_SERVER" -noverify

# #!/bin/bash

# OCSP_SERVER="http://127.0.0.1:8081"

# # OpenVPN sends multiple arguments; use the second argument as the cert file
# CERT=$2
# CA_CERT="/etc/openvpn/ca.crt"

# # Debugging log
# echo "OCSP Check for cert: $CERT" >> /var/log/ocsp_checker.log

# # Validate input
# if [ -z "$CERT" ]; then
#     echo "ERROR: No certificate provided" >> /var/log/ocsp_checker.log
#     exit 1
# fi

# # Run OpenSSL OCSP check
# openssl ocsp -issuer "$CA_CERT" -cert "$CERT" -url "$OCSP_SERVER" -noverify >> /var/log/ocsp_checker.log 2>&1
# EXIT_STATUS=$?

# # Debugging
# echo "OCSP Result: $EXIT_STATUS" >> /var/log/ocsp_checker.log

# exit $EXIT_STATUS

#!/bin/bash

# Change this to your OCSP responder's address
OCSP_SERVER="http://your-server-ip:2560"

# Certificate to check
CERT=$1
CA_CERT="ca.crt"

if [ -z "$CERT" ]; then
    echo "Usage: $0 <certificate.pem>"
    exit 1
fi

# Check OCSP status
openssl ocsp -issuer "$CA_CERT" -cert "$CERT" -url "$OCSP_SERVER" -noverify
