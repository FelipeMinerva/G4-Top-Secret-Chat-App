using Mercury.Engine.API.DbContext.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Mercury.Engine.API.DbContext.Mapping
{
    public class TbGroupMapping : IEntityTypeConfiguration<TbGroup>
    {
        public void Configure(EntityTypeBuilder<TbGroup> builder)
        {
            builder.HasKey(e => e.IdGroup)
                .HasName("tb_group_pkey");

            builder.ToTable("tb_group");

            builder.Property(e => e.IdGroup).HasColumnName("id_group");

            builder.Property(e => e.NmGroupName)
                .IsRequired()
                .HasColumnName("nm_group_name")
                .HasMaxLength(255);
        }
    }
}