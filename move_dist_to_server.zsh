echo Copying files from 'dist' folder to the server 'static' folder
rm -r ../Server/Ease/static/*
rm -r ../Server/Ease/static/.*
cp -r dist/* ../Server/Ease/static
cp -r dist/.* ../Server/Ease/static
echo Done
