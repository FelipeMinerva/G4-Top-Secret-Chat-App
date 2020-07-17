using Mercury.Engine.API.DbContext.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace Mercury.Engine.API.DbContext.Mapping
{
    public class TbUserMapping : IEntityTypeConfiguration<TbUser>
    {
        public void Configure(EntityTypeBuilder<TbUser> builder)
        {
            builder.Property(e => e.IdUser)
                .HasColumnName("id_user");

            builder.HasKey(e => e.IdUser)
                .HasName("tb_user_pkey");

            builder.ToTable("tb_user");

            builder.Property(e => e.TxEmail)
            .IsRequired()
            .HasColumnName("tx_email")
            .HasMaxLength(255);

            builder.HasIndex(e => e.TxEmail)
                .HasName("IX_EMAIL")
                .IsUnique();

            builder.Property(e => e.TxUserTag)
                .IsRequired()
                .HasColumnName("tx_user_tag")
                .HasMaxLength(63);

            builder.HasIndex(e => e.TxUserTag)
                .HasName("IX_USER_TAG")
                .IsUnique();
        }
    }
}