using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using BussinessObject;
using System.Data.SqlClient;
using System.Collections;

namespace Bussinesslogic
{
    public class VideosBL
    {
        VideosDA videos = new VideosDA();

        public SqlDataAdapter Videos_SelectAll()
        {
            return videos.Videos_SelectALL();
        }
        public SqlDataAdapter Videos_SoLuong(int SoLuong)
        {
            return videos.Videos_SoLuong(SoLuong);
        }
        public SqlDataAdapter Videos_MaVideo(int MaVideo)
        {
            return videos.Videos_MaVideo(MaVideo);
        }
        public int Insert(string TenVideo, string LinkVideo, string PosterVideo)
        {
            return videos.Insert(TenVideo, LinkVideo, PosterVideo);
        }
        public int Update(int MaVideo, string TenVideo, string LinkVideo, string PosterVideo)
        {
            return videos.Update(MaVideo, TenVideo, LinkVideo, PosterVideo);
        }
        public int Delete(int MaVideo)
        {
            return videos.Delete(MaVideo);
        }
    }
}
