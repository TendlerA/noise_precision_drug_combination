function [name,path]=getFilePathsNames(folder_path)
    file_list=dir(folder_path);
    folder={file_list.folder};
    name={file_list.name};
    path=cellfun(@(x,y)strcat(x,'/',y),folder,name,'UniformOutput',false);
end
