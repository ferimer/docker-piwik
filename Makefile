
piwik.zip: clean
	curl https://builds.piwik.org/piwik.zip > piwik.zip
	mkdir piwik
	cd piwik; unzip ../piwik.zip

clean:
	rm -rf piwik
	rm -f piwik.zip

docker: piwik.zip
	docker build -f Dockerfile -t ferimer/piwik:latest .

publish: docker
	docker push ferimer/piwik:latest

