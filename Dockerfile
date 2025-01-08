FROM python:3.10.9

WORKDIR /home/geometry
COPY . .
COPY --from=builder /z3-source/ /home/z3-source/

RUN pip install --require-hashes --use-deprecated=legacy-resolver -r requirements.txt
RUN bash extrasetup.sh
RUN rm -rf /home/geometry
CMD [ "bash" ]