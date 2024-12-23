# Create a temporary JSON file with the necessary settings
TEMP_SETTINGS_FILE=$(mktemp -t 'man-shortcuts-off.json')

# Write the JSON configuration to disable the conflicting shortcuts
cat > $TEMP_SETTINGS_FILE <<EOF
{
  "NSServicesStatus": {
    "com.apple.Terminal - Search man Page Index in Terminal - searchManPages": {
      "presentation_modes": {
        "ContextMenu": false,
        "ServicesMenu": false
      },
      "enabled_context_menu": false,
      "enabled_services_menu": false
    }
  }
}
EOF

# Apply the settings using the 'defaults' command
plutil -convert xml1 -o - $TEMP_SETTINGS_FILE | defaults import pbs -

# Remove the temporary file
rm $TEMP_SETTINGS_FILE
