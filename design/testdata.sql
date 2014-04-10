insert into video(client_id,category_id,name,img_path,video_path_webm,video_path_ogg,video_path_mp4) 
select 2,1,name,img_path,video_path_webm,video_path_ogg,video_path_mp4 from video where id = 1;

insert into video(client_id,category_id,name,img_path,video_path_webm,video_path_ogg,video_path_mp4) 
select 2,2,name,img_path,video_path_webm,video_path_ogg,video_path_mp4 from video where id = 1;

insert into video(client_id,category_id,name,img_path,video_path_webm,video_path_ogg,video_path_mp4) 
select 3,1,name,img_path,video_path_webm,video_path_ogg,video_path_mp4 from video where id = 1;

insert into video(client_id,category_id,name,img_path,video_path_webm,video_path_ogg,video_path_mp4) 
select 3,2,name,img_path,video_path_webm,video_path_ogg,video_path_mp4 from video where id = 1;

insert into video(client_id,category_id,name,img_path,video_path_webm,video_path_ogg,video_path_mp4) 
select 3,3,name,img_path,video_path_webm,video_path_ogg,video_path_mp4 from video where id = 1;

update video set description = 'this is a test video of client 1 category 1, this is a test video of client 1 category 1,this is a test video of client 1 category 1' where id = 1;

update video set description = 'this is a test video of client 2 category 1, this is a test video of client 2 category 1,this is a test video of client 2 category 1' where id = 2;

update video set description = 'this is a test video of client 2 category 2, this is a test video of client 2 category 2,this is a test video of client 2 category 2' where id = 3;

update video set description = 'this is a test video of client 3 category 1, this is a test video of client 3 category 1,this is a test video of client 3 category 1' where id = 4;

update video set description = 'this is a test video of client 3 category 2, this is a test video of client 3 category 2,this is a test video of client 3 category 2' where id = 5;

update video set description = 'this is a test video of client 3 category 3, this is a test video of client 3 category 3,this is a test video of client 3 category 3' where id = 6;