PROCESSING_JAVA = $(shell flatpak info --show-location org.processing.processingide)/files/share/processing/processing-java

OUTPUT_DIR		= output

SKETCH_DIR      = $(shell pwd)
SKETCH_NAME     = $(notdir ${SKETCH_DIR})
SKETCH_SRC      = ${SKETCH_NAME}.pde
SKETCH_CLASS    = ${OUTPUT_DIR}/${SKETCH_NAME}.class


{SKETCH_CLASS}: ${SKETCH_SRC}
	cd ..;									\
	$(PROCESSING_JAVA)						\
	--sketch=${SKETCH_DIR}					\
	--output=${SKETCH_DIR}/${OUTPUT_DIR}	\
	--force									\
	--build

build:	${SKETCH_CLASS}

run:	${SKETCH_CLASS}
	cd ..;									\
	$(PROCESSING_JAVA)						\
	--sketch=${SKETCH_DIR}					\
	--output=${SKETCH_DIR}/${OUTPUT_DIR}	\
	--force									\
	--run

export:
	cd ..;									\
	$(PROCESSING_JAVA)						\
	--sketch=${SKETCH_DIR}					\
	--output=${SKETCH_DIR}/${OUTPUT_DIR}	\
	--force									\
	--export								\
	--linux

clean:
	rm -rf ${OUTPUT_DIR}

###