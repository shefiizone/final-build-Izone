@echo off
echo Cleaning up...
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del package-lock.json

echo Creating configuration...
echo legacy-peer-deps=true > .npmrc

echo Installing dependencies (this may take a few minutes)...
npm install --legacy-peer-deps

echo.
if %ERRORLEVEL% EQU 0 (
    echo SUCCESS! You can now run the app with: npm run dev
) else (
    echo Installation failed. Trying without scripts...
    npm install --legacy-peer-deps --ignore-scripts
    echo If this worked, run: npm run dev
)
pause
