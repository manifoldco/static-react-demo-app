.env.local:
	manifold export | grep = | sort | sed -e 's|\([a-zA-Z_]*\)=\(.*\)|REACT_APP_\1=NGINX_REPLACE_\1|' > .env.local

build/index.html: .env.local
	yarn build

NGINX_SUB_FILTER?=$(shell manifold export | grep '=' | sort | sed -e 's/\(.*\)=\(.*\)/sub_filter\ \"NGINX_REPLACE_\1\" \"$$\{\1\}\";/')

nginx.conf:
	cat nginx.conf.sample | sed -e 's|LOCATION_SUB_FILTER|\${NGINX_SUB_FILTER}|' | sed 's|}";\ |}";\n\t\t|g' > nginx.conf

docker: build/index.html nginx.conf
	docker build -t manifoldco/demo-app:latest .

clean:
	rm -rf build
	rm -f nginx.conf
	rm -f .env.local
