import os

def main():
    try:
        package = input("Please input the package name\npackage name: ")
        name = input("Please input the feature name for the files that will be created\nname: ")
        execute('{}/lib/features/{}'.format(package,name), name)
    except ValueError:
        print("Please input with either y or n.")

        
def execute(package, name):
    main_dir = [package]
    sub_dir = ['data', 'domain', 'presentation']
    sub_data_dir = ['datasources','models', 'repositories']
    sub_domain_dir = ['entities','usecases', 'repositories']
    sub_pres_dir = ['screens']
    sub_ds_dir = ['remote','local']

    for dir1 in main_dir:
        for dir2 in sub_dir:
            if dir2 == 'data':
                for dir3 in sub_data_dir:
                    if dir3 == 'datasources':
                        for dir4 in sub_ds_dir:
                            try: 
                                os.makedirs(os.path.join(dir1,dir2,dir3,dir4))
                                if dir4 == 'remote':
                                    os.open(os.path.join(dir1,dir2,dir3,dir4) + '/{}_remote_datasource.dart'.format(name),os.O_CREAT)
                                if dir4 == 'local':
                                    os.open(os.path.join(dir1,dir2,dir3,dir4) + '/{}_local_datasource.dart'.format(name),os.O_CREAT)
                            except: OSError
                    else:
                        try: os.makedirs(os.path.join(dir1,dir2,dir3))
                        except: OSError
                        if dir3 == 'models':
                            os.open(os.path.join(dir1,dir2,dir3,) + '/{}_model.dart'.format(name),os.O_CREAT)
                        if dir3 == 'repositories':
                            os.open(os.path.join(dir1,dir2,dir3,) + '/{}_repository_impl.dart'.format(name),os.O_CREAT)
            if dir2 == 'domain':
                for dir3 in sub_domain_dir:
                    try: 
                        os.makedirs(os.path.join(dir1,dir2,dir3))
                        if dir3 == 'entities':
                            os.open(os.path.join(dir1,dir2,dir3,) + '/{}_entity.dart'.format(name),os.O_CREAT)
                        if dir3 == 'repositories':
                            os.open(os.path.join(dir1,dir2,dir3,) + '/{}_repository.dart'.format(name),os.O_CREAT)
                        if dir3 == 'usecases':
                            os.open(os.path.join(dir1,dir2,dir3,) + '/{}_usecase.dart'.format(name),os.O_CREAT)
                    except: OSError
            if dir2 == 'presentation':
                for dir3 in sub_pres_dir:
                    try: 
                        os.makedirs(os.path.join(dir1,dir2,dir3))
                        os.open(os.path.join(dir1,dir2,dir3,) + '/{}_screen.dart'.format(name),os.O_CREAT)
                    except: OSError

main()

