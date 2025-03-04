sudo openssl ocsp -index demoCA/index.txt -CA ca.crt -rsigner ocsp.crt -rkey ocsp.key -port 8081 -text -out log_ocsp.txt 
