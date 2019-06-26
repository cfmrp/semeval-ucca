all: competition/scoring_program.zip competition/training.zip competition/input.zip competition/evaluation.zip competition/companion.zip competition/sample.zip competition.zip submission.zip

competition/scoring_program.zip: scoring_program/* scoring_program/mtool
	cd scoring_program && zip -r ../competition/scoring_program.zip * && cd ..

scoring_program/mtool:
    cd scoring_program && git clone https://github.com/cfmrp/mtool

competition/training.zip: mrp
	cd mrp/2019/training && zip -r ../../../competition/training.zip */*.mrp

competition/input.zip: mrp
	cd mrp/2019/evaluation && make evaluation && zip -r ../../../competition/input.zip input.mrp

competition/evaluation.zip: mrp
	cd mrp/2019/evaluation && zip -r ../../../competition/evaluation.zip */*.mrp

competition/companion.zip: mrp
	cd mrp/2019/companion && zip -r ../../../competition/companion.zip *.mrp */*.conllu

competition/sample.zip: mrp
	cd mrp/2019/sample && zip -r ../../../competition/sample.zip */*.mrp

competition.zip: competition/* competition/scoring_program.zip competition/training.zip competition/evaluation.zip competition/companion.zip competition/sample.zip
	cd competition && zip -r  ../competition.zip * && cd ..

submission.zip: mrp
	mkdir -p submission && cd submission && cat mrp/2019/sample/*/*.mrp > sample.mrp && zip -r ../submission.zip *

mrp:
    svn checkout http://svn.nlpl.eu/mrp

clean:
	rm competition/scoring_program.zip competition/training.zip competition/input.zip competition/evaluation.zip competition/companion.zip competition/sample.zip competition.zip submission.zip