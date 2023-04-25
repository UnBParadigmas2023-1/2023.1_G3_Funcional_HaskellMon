FROM haskell
WORKDIR /app
COPY /app /app
RUN ghc *.hs
CMD ["./main"]
