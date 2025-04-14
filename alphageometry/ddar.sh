python -m alphageometry \
--alsologtostderr \
--problems_file=$(pwd)/imo_ag_30.txt \
--problem_name=translated_imo_2000_p6 \
--mode=ddar \
"${DDAR_ARGS[@]}" \
--out_file=ddar.txt