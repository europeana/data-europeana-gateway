# Data Gateway

Gateway to handle redirects to data.europeana.eu using NGINX.

## Usage

### Kubernetes

* Review environment variables set in env-nginx
* Review the Jenkins Data Gateway job (test/acc/prod) configuration 
* Run the Jenkins Data Gateway job
* The Data Gateway will be deployed to the job's configured environment


### local

* Review environment variables set in env-nginx-local, especially:

```
export USE_EPOLL='#' (comments out EPoll)
export WORKER_CONNECTIONS=256
export PORT='8088'
export PUBLIC_FOLDER='{NGINX_HOME}public'
```
   
* copy these to your NGINX_HOME directory:
	* env-nginx-local
	* nginx-conf-template
	* mime.types
	* nginx.conf.d/ (directory)
	* public/ (directory)
* make sure env-nginx-local is executable, eg. `chmod +x env-nginx-local`
* execute env-nginx-local to create nginx.conf
* start nginx
* The Data Gateway will be available at http://localhost:8080/
* After making changes to nginx-conf-template, re-run env-nginx-local to update nginx.conf & restart nginx
* when done, copy nginx-conf-template back to the Git Data Gateway directory & commit

## TODO

* Add a test suite

## License

Licensed under the EUPL V.1.1.

For full details, see [LICENSE.md](LICENSE.md).
