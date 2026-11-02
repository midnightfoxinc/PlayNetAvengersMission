.class Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;
.super Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type2Message"
.end annotation


# instance fields
.field protected challenge:[B

.field protected flags:I

.field protected target:Ljava/lang/String;

.field protected targetInfo:[B


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/ntlm/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x14

    .line 981
    const/4 v2, 0x2

    invoke-direct {p0, p1, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;-><init>(Ljava/lang/String;I)V

    .line 998
    const/16 v2, 0x8

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->challenge:[B

    .line 999
    iget-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->challenge:[B

    const/16 v3, 0x18

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->readBytes([BI)V

    .line 1001
    invoke-virtual {p0, v4}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->readULong(I)I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->flags:I

    .line 1003
    iget v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_0

    .line 1004
    new-instance v2, Lcom/ning/http/client/ntlm/NTLMEngineException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NTLM type 2 message indicates no support for Unicode. Flags are: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->flags:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1008
    :cond_0
    iput-object v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->target:Ljava/lang/String;

    .line 1012
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getMessageLength()I

    move-result v2

    if-lt v2, v4, :cond_1

    .line 1013
    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->readSecurityBuffer(I)[B

    move-result-object v0

    .line 1014
    .local v0, "bytes":[B
    array-length v2, v0

    if-eqz v2, :cond_1

    .line 1016
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UnicodeLittleUnmarked"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v2, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->target:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1024
    .end local v0    # "bytes":[B
    :cond_1
    iput-object v5, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->targetInfo:[B

    .line 1026
    invoke-virtual {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->getMessageLength()I

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_2

    .line 1027
    const/16 v2, 0x28

    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->readSecurityBuffer(I)[B

    move-result-object v0

    .line 1028
    .restart local v0    # "bytes":[B
    array-length v2, v0

    if-eqz v2, :cond_2

    .line 1029
    iput-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->targetInfo:[B

    .line 1032
    .end local v0    # "bytes":[B
    :cond_2
    return-void

    .line 1017
    .restart local v0    # "bytes":[B
    :catch_0
    move-exception v1

    .line 1018
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lcom/ning/http/client/ntlm/NTLMEngineException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/ning/http/client/ntlm/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method getChallenge()[B
    .locals 1

    .prologue
    .line 1036
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->challenge:[B

    return-object v0
.end method

.method getFlags()I
    .locals 1

    .prologue
    .line 1051
    iget v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->flags:I

    return v0
.end method

.method getTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1041
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->target:Ljava/lang/String;

    return-object v0
.end method

.method getTargetInfo()[B
    .locals 1

    .prologue
    .line 1046
    iget-object v0, p0, Lcom/ning/http/client/ntlm/NTLMEngine$Type2Message;->targetInfo:[B

    return-object v0
.end method
