.class public Lcom/disney/emagine/sdk/EMTAdvertisementData;
.super Ljava/lang/Object;
.source "EMTAdvertisementData.java"


# static fields
.field public static final KEY_COMPANY_CODE:Ljava/lang/String; = "COMPANYCODE"

.field public static final KEY_LOCAL_NAME:Ljava/lang/String; = "LOCALNAME"

.field public static final KEY_MANUFACTURER_DATA:Ljava/lang/String; = "MANUDATA"

.field public static final KEY_SERVICE_LIST:Ljava/lang/String; = "SERVICES"

.field private static final TYPE_COMPLETE_LIST_128_SERVICE_UUIDS:B = 0x7t

.field private static final TYPE_INCOMPLETE_LIST_128_SERVICE_UUIDS:B = 0x6t

.field private static final TYPE_LOCAL_NAME:B = 0x9t

.field private static final TYPE_MANUFACTURER_DATA:B = -0x1t


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse([B)Landroid/os/Bundle;
    .locals 8
    .param p0, "adv"    # [B

    .prologue
    const/4 v7, 0x2

    .line 63
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 64
    .local v2, "result":Landroid/os/Bundle;
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 66
    .local v0, "buf":Ljava/nio/ByteBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-lez v5, :cond_0

    .line 69
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 71
    .local v1, "length":I
    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-le v1, v5, :cond_1

    .line 105
    .end local v1    # "length":I
    :cond_0
    return-object v2

    .line 77
    .restart local v1    # "length":I
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    .line 80
    .local v4, "type":B
    add-int/lit8 v5, v1, -0x1

    new-array v3, v5, [B

    .line 82
    .local v3, "struct":[B
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 84
    sparse-switch v4, :sswitch_data_0

    goto :goto_0

    .line 96
    :sswitch_0
    const-string v5, "COMPANYCODE"

    const/4 v6, 0x0

    invoke-static {v3, v6, v7}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 97
    const-string v5, "MANUDATA"

    array-length v6, v3

    invoke-static {v3, v7, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_0

    .line 88
    :sswitch_1
    const-string v5, "SERVICES"

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTAdvertisementData;->parseUuids([B)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 92
    :sswitch_2
    const-string v5, "LOCALNAME"

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 84
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x6 -> :sswitch_1
        0x7 -> :sswitch_1
        0x9 -> :sswitch_2
    .end sparse-switch
.end method

.method private static parseUuids([B)Ljava/util/ArrayList;
    .locals 8
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/ParcelUuid;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 111
    .local v0, "buf":Ljava/nio/ByteBuffer;
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 113
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v1, "uuids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/ParcelUuid;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    const/16 v7, 0x10

    if-lt v6, v7, :cond_0

    .line 117
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    .line 118
    .local v2, "lsb":J
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    .line 119
    .local v4, "msb":J
    new-instance v6, Landroid/os/ParcelUuid;

    new-instance v7, Ljava/util/UUID;

    invoke-direct {v7, v4, v5, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    invoke-direct {v6, v7}, Landroid/os/ParcelUuid;-><init>(Ljava/util/UUID;)V

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 122
    .end local v2    # "lsb":J
    .end local v4    # "msb":J
    :cond_0
    return-object v1
.end method
