#!/bin/bash
set -e
set -x

DATA=ag_ckpt_vocab
MELIAD_PATH=meliad_lib/meliad
export PYTHONPATH=$PYTHONPATH:$MELIAD_PATH
DDAR_ARGS=(
  --defs_file=$(pwd)/defs.txt \
  --rules_file=$(pwd)/rules.txt \
);
BATCH_SIZE=2
BEAM_SIZE=2
DEPTH=2
SEARCH_ARGS=(
  --beam_size=$BEAM_SIZE
  --search_depth=$DEPTH
)
LM_ARGS=(
  --ckpt_path=$DATA \
  --vocab_path=$DATA/geometry.757.model \
  --gin_search_paths=$MELIAD_PATH/transformer/configs \
  --gin_file=base_htrans.gin \
  --gin_file=size/medium_150M.gin \
  --gin_file=options/positions_t5.gin \
  --gin_file=options/lr_cosine_decay.gin \
  --gin_file=options/seq_1024_nocache.gin \
  --gin_file=geometry_150M_generate.gin \
  --gin_param=DecoderOnlyLanguageModelGenerate.output_token_losses=True \
  --gin_param=TransformerTaskConfig.batch_size=$BATCH_SIZE \
  --gin_param=TransformerTaskConfig.sequence_length=128 \
  --gin_param=Trainer.restore_state_variables=False
);

problems=("translated_imo_2000_p1" "translated_imo_2000_p6" "translated_imo_2002_p2a" "translated_imo_2002_p2b" "translated_imo_2003_p4" "translated_imo_2004_p1" "translated_imo_2004_p5" "translated_imo_2005_p5" "translated_imo_2007_p4" "translated_imo_2008_p1a" "translated_imo_2008_p1b" "translated_imo_2008_p6" "translated_imo_2009_p2" "translated_imo_2010_p2" "translated_imo_2010_p4" "translated_imo_2011_p6" "translated_imo_2012_p1" "translated_imo_2012_p5" "translated_imo_2013_p4" "translated_imo_2014_p4" "translated_imo_2015_p3" "translated_imo_2015_p4" "translated_imo_2016_p1" "translated_imo_2017_p4" "translated_imo_2018_p1" "translated_imo_2019_p2" "translated_imo_2019_p6" "translated_imo_2020_p1" "translated_imo_2021_p3" "translated_imo_2022_p4" )

problems=("${problems[@]:$1:$2}")

for problem in "${problems[@]}";
do
    python -m alphageometry --alsologtostderr --problems_file=$(pwd)/imo_ag_30.txt --problem_name=$problem --mode=alphageometry  "${DDAR_ARGS[@]}" "${SEARCH_ARGS[@]}" "${LM_ARGS[@]}" --out_file="proofs/${problem}.txt"
done
