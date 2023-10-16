# sdk
Open-Meteo schema files 


```bash
flatc --swift -o swift/Sources/OpenMeteoSdk/ flatbuffers/*.fbs
flatc --python --python-typing -o python/ flatbuffers/*.fbs
flatc --ts -o ts/ flatbuffers/*.fbs


```