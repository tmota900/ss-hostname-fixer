FROM curlimages/curl:7.85.0

COPY hostfix.sh /usr/local/bin/hostfix.sh

CMD [ "/usr/local/bin/hostfix.sh" ]