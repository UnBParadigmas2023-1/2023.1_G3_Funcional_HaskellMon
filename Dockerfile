FROM haskell
WORKDIR /app
COPY /app /app
RUN cabal update
RUN cabal install --lib random
RUN cabal install --lib random-shuffle
RUN ghc *.hs -package random
CMD ["./main"]
