#!/bin/bash

API="http://localhost:4741"
URL_PATH="/exercises"
TOKEN=tcB8LN3gsIG20IdPmdDtrV2OoeMvdR23AyCA6CQM5/Y=--Di/7eyTv/Jj48zW8uv8+gO+b7OLlRVfkNXjDDcbrbN4=
TEXT='The panel may have been conceived as either the left-hand wing of a since dismantled diptych, or as the front piece of a double-sided panel.[11] Art historian Erwin Panofsky suggests that the Washington Saint George and the Dragon of 1432–35 is the most likely opposite wing.[12] In that work, St. George, facing inwards and to the right, slays the dragon before a Libyan princess. Although the pairing might seem incongruous, his Madonna Standing is widely thought to have been attached with the St. Catherine of Alexandria in Vienna.[12] In both panels, the saints face inwards and are within fully realised landscapes. In contrast, in both left h Madonna and Child are positioned frontally (although eye contact is avoided) and isolated within col'
NAME='Sample Exercise 9'
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "exercise": {
      "text": "'"${TEXT}"'",
      "name": "'"${NAME}"'"
    }
  }'

echo
