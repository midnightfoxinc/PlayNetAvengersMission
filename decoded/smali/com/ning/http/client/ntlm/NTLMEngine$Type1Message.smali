.class Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;
.super Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;
.source "NTLMEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ntlm/NTLMEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Type1Message"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 909
    invoke-direct {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/ntlm/NTLMEngine$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/ntlm/NTLMEngine$1;

    .prologue
    .line 909
    invoke-direct {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;-><init>()V

    return-void
.end method


# virtual methods
.method getResponse()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x28

    const/4 v2, 0x0

    .line 919
    const/16 v0, 0x28

    .line 923
    .local v0, "finalLength":I
    const/4 v1, 0x1

    invoke-virtual {p0, v3, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->prepareResponse(II)V

    .line 926
    const v1, -0x5df77dff

    invoke-virtual {p0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addULong(I)V

    .line 949
    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 950
    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 953
    invoke-virtual {p0, v3}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addULong(I)V

    .line 956
    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 957
    invoke-virtual {p0, v2}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 960
    invoke-virtual {p0, v3}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addULong(I)V

    .line 963
    const/16 v1, 0x105

    invoke-virtual {p0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 965
    const/16 v1, 0xa28

    invoke-virtual {p0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addULong(I)V

    .line 967
    const/16 v1, 0xf00

    invoke-virtual {p0, v1}, Lcom/ning/http/client/ntlm/NTLMEngine$Type1Message;->addUShort(I)V

    .line 969
    invoke-super {p0}, Lcom/ning/http/client/ntlm/NTLMEngine$NTLMMessage;->getResponse()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
