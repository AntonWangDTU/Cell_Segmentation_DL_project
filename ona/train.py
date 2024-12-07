from cellpose import io, models, train
io.logger_setup()

output = io.load_train_test_data(train_dir = "/zhome/c9/0/203261/blackhole/DL_project/Cell_Segmentation_DL_project/Ona/data/train", 
				test_dir = "/zhome/c9/0/203261/blackhole/DL_project/Cell_Segmentation_DL_project/Ona/data/test", 
				image_filter="_img",
                                mask_filter="_masks", 
				look_one_level_down=False)
images, labels, image_names, test_images, test_labels, image_names_test = output

# e.g. retrain a Cellpose model
model = models.CellposeModel(model_type=None)

model_path, train_losses, test_losses = train.train_seg(model.net,
                            train_data=images, train_labels=labels,
                            channels=[0,0], normalize=True,
                            test_data=test_images, test_labels=test_labels,
                            weight_decay=1e-4, SGD=True, learning_rate=0.1,
                            n_epochs=100, model_name="test_model")
