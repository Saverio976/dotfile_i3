TARGET		=	myi3

build:
	podman build -t "$(TARGET)" .

run:
	podman run --rm -it "$(TARGET)"
