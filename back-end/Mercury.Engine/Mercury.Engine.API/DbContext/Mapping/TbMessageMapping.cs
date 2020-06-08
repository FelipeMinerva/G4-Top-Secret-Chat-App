using Mercury.Engine.API.DbContext.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Mercury.Engine.API.DbContext.Mapping
{
    public class TbMessageMapping : IEntityTypeConfiguration<TbMessage>
    {
        public void Configure(EntityTypeBuilder<TbMessage> builder)
        {
            builder.HasKey(e => e.IdMessage)
                    .HasName("tb_message_pkey");

            builder.ToTable("tb_message");

            builder.Property(e => e.IdMessage).HasColumnName("id_message");

            builder.Property(e => e.DtTimestamp).HasColumnName("dt_timestamp");

            builder.Property(e => e.FkGroup).HasColumnName("fk_group");

            builder.Property(e => e.FkUser).HasColumnName("fk_user");

            builder.Property(e => e.TxMessage)
                .IsRequired()
                .HasColumnName("tx_message")
                .HasMaxLength(1023);

            builder.HasOne(d => d.FkGroupNavigation)
                .WithMany(p => p.TbMessage)
                .HasForeignKey(d => d.FkGroup)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_message_group");

            builder.HasOne(d => d.FkUserNavigation)
                .WithMany(p => p.TbMessage)
                .HasForeignKey(d => d.FkUser)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_message_user");
        }
    }
}