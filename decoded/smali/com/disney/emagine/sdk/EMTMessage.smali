.class public Lcom/disney/emagine/sdk/EMTMessage;
.super Ljava/lang/Object;
.source "EMTMessage.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public data:[B

.field public keySlot:B

.field public length:J

.field public nonce:[B

.field public senderAddress:I

.field public sequence:B

.field public targetAddress:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput v2, p0, Lcom/disney/emagine/sdk/EMTMessage;->targetAddress:I

    .line 15
    iput v2, p0, Lcom/disney/emagine/sdk/EMTMessage;->senderAddress:I

    .line 17
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    .line 18
    iput-byte v2, p0, Lcom/disney/emagine/sdk/EMTMessage;->sequence:B

    .line 19
    iput-byte v2, p0, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    .line 23
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
