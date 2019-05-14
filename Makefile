build:
	docker build -t aprenita-nvim .

run:
	docker run --rm -it \
	-v /Users/westandskif/Work/aprenita:/app:delegated \
	-v /Users/westandskif/Work/aprenita-infrastructure:/infra \
	-v /Users/westandskif/Own/nvim-conf/config:/mnt/vim-config \
	aprenita-nvim bash
