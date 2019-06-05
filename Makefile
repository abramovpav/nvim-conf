docker_nvim := docker run --rm -it \
        --network host \
	-v /Users/westandskif/Work/aprenita:/app:cached \
	-v /Users/westandskif/Work/aprenita-infrastructure:/infra:cached \
	-v /Users/westandskif/Work/amt:/amt:cached \
	-v /Users/westandskif/Own/nvim-conf/config:/mnt/vim-config \
	aprenita-nvim
build:
	docker build -t aprenita-nvim .

run:
	$(docker_nvim) nvim
bash:
	$(docker_nvim) bash
