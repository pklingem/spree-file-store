class FileStoreHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%= tab(:uploaded_files) %>)
  end
end
