using Mercury.Engine.API.DbContext.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Mercury.Engine.API.DbContext.Mapping
{
    public class TbUserGroupMapping : IEntityTypeConfiguration<TbUserGroup>
    {
        public void Configure(EntityTypeBuilder<TbUserGroup> builder)
        {
            builder.HasKey(e => new { e.FkUser, e.FkGroup })
                .HasName("tb_user_group_pkey");

            builder.ToTable("tb_user_group");

            builder.Property(e => e.FkUser).HasColumnName("fk_user");

            builder.Property(e => e.FkGroup).HasColumnName("fk_group");

            builder.HasOne(d => d.FkGroupNavigation)
                .WithMany(p => p.TbUserGroup)
                .HasForeignKey(d => d.FkGroup)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_user_group_group");

            builder.HasOne(d => d.FkUserNavigation)
                .WithMany(p => p.TbUserGroup)
                .HasForeignKey(d => d.FkUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_user_group_user");

        }
    }
}