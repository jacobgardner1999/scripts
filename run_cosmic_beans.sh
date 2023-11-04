#!/bin/bash
JAVA_FX_SDK="/Library/Java/javafx-sdk-21.0.1/"
java --module-path "$JAVA_FX_SDK/lib" --add-modules javafx.controls,javafx.fxml -cp ~/Documents/coding/CosmicBeans/target/classes/ UI.Main
