using System;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Mapping;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Mercury.Engine.API.DbContext
{
    public partial class DbMercuryContext : Microsoft.EntityFrameworkCore.DbContext
    {
        public DbMercuryContext()
        {
        }

        public DbMercuryContext(DbContextOptions<DbMercuryContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TbGroup> TbGroup { get; set; }
        public virtual DbSet<TbMessage> TbMessage { get; set; }
        public virtual DbSet<TbUser> TbUser { get; set; }
        public virtual DbSet<TbUserGroup> TbUserGroup { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                // optionsBuilder.UseNpgsql("host=localhost; port=5432; database=db_mercury; username=minerva; password=morgana");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.ApplyConfiguration(new TbGroupMapping());
            modelBuilder.ApplyConfiguration(new TbUserMapping());
            modelBuilder.ApplyConfiguration(new TbUserGroupMapping());
            modelBuilder.ApplyConfiguration(new TbMessageMapping());

            modelBuilder.UseIdentityColumns();

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
