.class public Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
.super Ljava/lang/Object;
.source "EMTMessageEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MessageHeader"
.end annotation


# static fields
.field public static final HEADER_SIZE:I = 0xc


# instance fields
.field private deviceID_from:I

.field private deviceID_to:I

.field private eventID:S

.field private header:[B

.field final synthetic this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

.field private union0:B

.field private union1:B


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;)V
    .locals 2
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    .line 97
    const/16 v0, 0xc

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    .line 99
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 100
    return-void
.end method

.method public constructor <init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;I)V
    .locals 2
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;
    .param p2, "payloadSize"    # I

    .prologue
    .line 103
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->this$0:Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    .line 104
    add-int/lit8 v0, p2, 0xc

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    .line 106
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->memsetBytes([BB)[B

    .line 107
    return-void
.end method


# virtual methods
.method public count()S
    .locals 1

    .prologue
    .line 156
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    and-int/lit8 v0, v0, 0xf

    int-to-short v0, v0

    return v0
.end method

.method public deviceID_from()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->deviceID_from:I

    return v0
.end method

.method public deviceID_to()I
    .locals 1

    .prologue
    .line 116
    iget v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->deviceID_to:I

    return v0
.end method

.method public eventID()S
    .locals 1

    .prologue
    .line 136
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->eventID:S

    return v0
.end method

.method public header()[B
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header:[B

    return-object v0
.end method

.method public setCount(S)V
    .locals 2
    .param p1, "value"    # S

    .prologue
    .line 162
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    and-int/lit16 v0, v0, 0xf0

    int-to-byte v1, p1

    and-int/lit8 v1, v1, 0xf

    or-int/2addr v0, v1

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    .line 163
    return-void
.end method

.method public setDeviceID_from(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 131
    iput p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->deviceID_from:I

    .line 132
    return-void
.end method

.method public setDeviceID_to(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 121
    iput p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->deviceID_to:I

    .line 122
    return-void
.end method

.method public setEventID(S)V
    .locals 0
    .param p1, "value"    # S

    .prologue
    .line 141
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->eventID:S

    .line 142
    return-void
.end method

.method public setSize(S)V
    .locals 2
    .param p1, "value"    # S

    .prologue
    .line 184
    and-int/lit8 v0, p1, 0xf

    iget-byte v1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    and-int/lit16 v1, v1, 0xf0

    or-int/2addr v0, v1

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    .line 185
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union1:B

    .line 186
    return-void
.end method

.method public setTypeMask(S)V
    .locals 1
    .param p1, "value"    # S

    .prologue
    .line 172
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union1:B

    .line 173
    return-void
.end method

.method public setVersion(S)V
    .locals 1
    .param p1, "value"    # S

    .prologue
    .line 151
    int-to-byte v0, p1

    shl-int/lit8 v0, v0, 0x4

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    .line 152
    return-void
.end method

.method public size()S
    .locals 2

    .prologue
    .line 178
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    and-int/lit8 v0, v0, 0xf

    shl-int/lit8 v0, v0, 0x8

    iget-byte v1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union1:B

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public typeMask()S
    .locals 1

    .prologue
    .line 167
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union1:B

    int-to-short v0, v0

    return v0
.end method

.method public version()S
    .locals 1

    .prologue
    .line 146
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->union0:B

    shr-int/lit8 v0, v0, 0x4

    int-to-short v0, v0

    return v0
.end method
