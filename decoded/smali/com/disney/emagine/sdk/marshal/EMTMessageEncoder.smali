.class public Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;
.super Ljava/lang/Object;
.source "EMTMessageEncoder.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "Assert"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;,
        Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$DataType;,
        Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageVersion;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->$assertionsDisabled:Z

    .line 19
    const-class v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->TAG:Ljava/lang/String;

    return-void

    .line 16
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 193
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 194
    return-void
.end method


# virtual methods
.method public createComplexMessage(SII[B)Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    .locals 5
    .param p1, "eventID"    # S
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "data"    # [B

    .prologue
    const/4 v4, 0x0

    .line 210
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;

    array-length v1, p4

    invoke-direct {v0, p0, v1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;-><init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;I)V

    .line 212
    .local v0, "msg":Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    invoke-virtual {v0, p3}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setDeviceID_to(I)V

    .line 213
    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setDeviceID_from(I)V

    .line 214
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setEventID(S)V

    .line 215
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setVersion(S)V

    .line 216
    invoke-virtual {v0, v4}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setSize(S)V

    .line 218
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header()[B

    move-result-object v1

    const/16 v2, 0xc

    array-length v3, p4

    invoke-static {p4, v4, v1, v2, v3}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 220
    return-object v0
.end method

.method public createSimpleMessage(SSIII)Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    .locals 1
    .param p1, "mv"    # S
    .param p2, "eventID"    # S
    .param p3, "from"    # I
    .param p4, "to"    # I
    .param p5, "payloadSize"    # I

    .prologue
    .line 198
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;

    invoke-direct {v0, p0, p5}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;-><init>(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;I)V

    .line 200
    .local v0, "msg":Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    invoke-virtual {v0, p4}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setDeviceID_to(I)V

    .line 201
    invoke-virtual {v0, p3}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setDeviceID_from(I)V

    .line 202
    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setEventID(S)V

    .line 203
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->setVersion(S)V

    .line 205
    return-object v0
.end method

.method public getMessagePayload(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;)[B
    .locals 4
    .param p1, "msg"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;

    .prologue
    .line 225
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header()[B

    move-result-object v1

    const/16 v2, 0xc

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->header()[B

    move-result-object v3

    array-length v3, v3

    invoke-static {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    .line 227
    .local v0, "payload":[B
    return-object v0
.end method

.method public itemAtIndexIsString(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;I)I
    .locals 3
    .param p1, "msg"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    .param p2, "index"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Assert"
        }
    .end annotation

    .prologue
    .line 233
    sget-boolean v1, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->version()S

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 234
    :cond_0
    sget-boolean v1, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/16 v1, 0x8

    if-lt p2, v1, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 236
    :cond_1
    const/4 v1, 0x1

    rsub-int/lit8 v2, p2, 0x7

    shl-int/2addr v1, v2

    int-to-char v0, v1

    .line 238
    .local v0, "mask":C
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;->typeMask()S

    move-result v1

    and-int/2addr v1, v0

    return v1
.end method

.method public logBufferAsHex(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;I)V
    .locals 6
    .param p1, "msg"    # Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;
    .param p2, "payloadSize"    # I

    .prologue
    .line 243
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->getMessagePayload(Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder$MessageHeader;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v0

    .line 245
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/marshal/EMTMessageEncoder;->TAG:Ljava/lang/String;

    const-string v3, "Sending buffer with contents [%s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    return-void
.end method
