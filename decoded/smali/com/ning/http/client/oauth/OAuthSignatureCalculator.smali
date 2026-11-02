.class public Lcom/ning/http/client/oauth/OAuthSignatureCalculator;
.super Ljava/lang/Object;
.source "OAuthSignatureCalculator.java"

# interfaces
.implements Lcom/ning/http/client/SignatureCalculator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/oauth/OAuthSignatureCalculator$Parameter;,
        Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
    }
.end annotation


# static fields
.field public static final HEADER_AUTHORIZATION:Ljava/lang/String; = "Authorization"

.field private static final KEY_OAUTH_CONSUMER_KEY:Ljava/lang/String; = "oauth_consumer_key"

.field private static final KEY_OAUTH_NONCE:Ljava/lang/String; = "oauth_nonce"

.field private static final KEY_OAUTH_SIGNATURE:Ljava/lang/String; = "oauth_signature"

.field private static final KEY_OAUTH_SIGNATURE_METHOD:Ljava/lang/String; = "oauth_signature_method"

.field private static final KEY_OAUTH_TIMESTAMP:Ljava/lang/String; = "oauth_timestamp"

.field private static final KEY_OAUTH_TOKEN:Ljava/lang/String; = "oauth_token"

.field private static final KEY_OAUTH_VERSION:Ljava/lang/String; = "oauth_version"

.field protected static final NONCE_BUFFER:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[B>;"
        }
    .end annotation
.end field

.field private static final OAUTH_SIGNATURE_METHOD:Ljava/lang/String; = "HMAC-SHA1"

.field private static final OAUTH_VERSION_1_0:Ljava/lang/String; = "1.0"


# instance fields
.field protected final consumerAuth:Lcom/ning/http/client/oauth/ConsumerKey;

.field protected final mac:Lcom/ning/http/client/oauth/ThreadSafeHMAC;

.field protected final userAuth:Lcom/ning/http/client/oauth/RequestToken;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$1;

    invoke-direct {v0}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$1;-><init>()V

    sput-object v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->NONCE_BUFFER:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/oauth/ConsumerKey;Lcom/ning/http/client/oauth/RequestToken;)V
    .locals 1
    .param p1, "consumerAuth"    # Lcom/ning/http/client/oauth/ConsumerKey;
    .param p2, "userAuth"    # Lcom/ning/http/client/oauth/RequestToken;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Lcom/ning/http/client/oauth/ThreadSafeHMAC;

    invoke-direct {v0, p1, p2}, Lcom/ning/http/client/oauth/ThreadSafeHMAC;-><init>(Lcom/ning/http/client/oauth/ConsumerKey;Lcom/ning/http/client/oauth/RequestToken;)V

    iput-object v0, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->mac:Lcom/ning/http/client/oauth/ThreadSafeHMAC;

    .line 79
    iput-object p1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->consumerAuth:Lcom/ning/http/client/oauth/ConsumerKey;

    .line 80
    iput-object p2, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    .line 81
    return-void
.end method

.method private baseUrl(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;
    .locals 5
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 96
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "scheme":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 99
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v0

    .line 102
    .local v0, "port":I
    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 103
    const/16 v3, 0x50

    if-ne v0, v3, :cond_0

    .line 104
    const/4 v0, -0x1

    .line 110
    :cond_0
    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 111
    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    :cond_1
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 114
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 105
    :cond_3
    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 106
    const/16 v3, 0x1bb

    if-ne v0, v3, :cond_0

    .line 107
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private constructAuthHeader(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p1, "signature"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;
    .param p3, "oauthTimestamp"    # J

    .prologue
    .line 183
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 184
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "OAuth "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    const-string v1, "oauth_consumer_key"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->consumerAuth:Lcom/ning/http/client/oauth/ConsumerKey;

    invoke-virtual {v2}, Lcom/ning/http/client/oauth/ConsumerKey;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    invoke-virtual {v1}, Lcom/ning/http/client/oauth/RequestToken;->getKey()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 187
    const-string v1, "oauth_token"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    invoke-virtual {v2}, Lcom/ning/http/client/oauth/RequestToken;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    :cond_0
    const-string v1, "oauth_signature_method"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "HMAC-SHA1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    const-string v1, "oauth_signature"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-static {v0, p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    const-string v1, "oauth_timestamp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    const-string v1, "oauth_nonce"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    invoke-static {v0, p2}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 199
    const-string v1, "\", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string v1, "oauth_version"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "1.0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private encodedParams(JLjava/lang/String;Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 7
    .param p1, "oauthTimestamp"    # J
    .param p3, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p4, "formParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    .local p5, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    const/4 v4, 0x0

    .line 124
    iget-object v5, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    invoke-virtual {v5}, Lcom/ning/http/client/oauth/RequestToken;->getKey()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    :goto_0
    add-int/lit8 v6, v5, 0x5

    if-eqz p4, :cond_3

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v5

    :goto_1
    add-int/2addr v5, v6

    if-eqz p5, :cond_0

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result v4

    :cond_0
    add-int v1, v5, v4

    .line 128
    .local v1, "allParametersSize":I
    new-instance v0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    invoke-direct {v0, v1}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;-><init>(I)V

    .line 131
    .local v0, "allParameters":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
    const-string v4, "oauth_consumer_key"

    iget-object v5, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->consumerAuth:Lcom/ning/http/client/oauth/ConsumerKey;

    invoke-virtual {v5}, Lcom/ning/http/client/oauth/ConsumerKey;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 132
    const-string v4, "oauth_nonce"

    invoke-virtual {v0, v4, p3}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 133
    const-string v4, "oauth_signature_method"

    const-string v5, "HMAC-SHA1"

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 134
    const-string v4, "oauth_timestamp"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 135
    iget-object v4, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    invoke-virtual {v4}, Lcom/ning/http/client/oauth/RequestToken;->getKey()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 136
    const-string v4, "oauth_token"

    iget-object v5, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->userAuth:Lcom/ning/http/client/oauth/RequestToken;

    invoke-virtual {v5}, Lcom/ning/http/client/oauth/RequestToken;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 138
    :cond_1
    const-string v4, "oauth_version"

    const-string v5, "1.0"

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    .line 140
    if-eqz p4, :cond_4

    .line 141
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/Param;

    .line 142
    .local v3, "param":Lcom/ning/http/client/Param;
    invoke-virtual {v3}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    goto :goto_2

    .end local v0    # "allParameters":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
    .end local v1    # "allParametersSize":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "param":Lcom/ning/http/client/Param;
    :cond_2
    move v5, v4

    .line 124
    goto :goto_0

    :cond_3
    move v5, v4

    goto :goto_1

    .line 145
    .restart local v0    # "allParameters":Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;
    .restart local v1    # "allParametersSize":I
    :cond_4
    if-eqz p5, :cond_5

    .line 146
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/Param;

    .line 147
    .restart local v3    # "param":Lcom/ning/http/client/Param;
    invoke-virtual {v3}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;

    goto :goto_3

    .line 150
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "param":Lcom/ning/http/client/Param;
    :cond_5
    invoke-virtual {v0}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator$OAuthParameterSet;->sortAndConcat()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public calculateAndAddSignature(Lcom/ning/http/client/Request;Lcom/ning/http/client/RequestBuilderBase;)V
    .locals 10
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/RequestBuilderBase",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, "requestBuilder":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<*>;"
    invoke-virtual {p0}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->generateNonce()Ljava/lang/String;

    move-result-object v6

    .line 86
    .local v6, "nonce":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->generateTimestamp()J

    move-result-wide v4

    .line 87
    .local v4, "timestamp":J
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getFormParams()Ljava/util/List;

    move-result-object v7

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getQueryParams()Ljava/util/List;

    move-result-object v8

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->calculateSignature(Ljava/lang/String;Lcom/ning/http/client/uri/Uri;JLjava/lang/String;Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    .line 88
    .local v9, "signature":Ljava/lang/String;
    invoke-direct {p0, v9, v6, v4, v5}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->constructAuthHeader(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "headerValue":Ljava/lang/String;
    const-string v1, "Authorization"

    invoke-virtual {p2, v1, v0}, Lcom/ning/http/client/RequestBuilderBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    .line 90
    return-void
.end method

.method public calculateSignature(Ljava/lang/String;Lcom/ning/http/client/uri/Uri;JLjava/lang/String;Ljava/util/List;Ljava/util/List;)Ljava/lang/String;
    .locals 11
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "oauthTimestamp"    # J
    .param p5, "nonce"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/uri/Uri;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 160
    .local p6, "formParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    .local p7, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-direct {p0, p2}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->baseUrl(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v0

    .local v0, "baseUrl":Ljava/lang/String;
    move-object v1, p0

    move-wide v2, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    .line 161
    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->encodedParams(JLjava/lang/String;Ljava/util/List;Ljava/util/List;)Ljava/lang/String;

    move-result-object v7

    .line 163
    .local v7, "encodedParams":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v10

    .line 164
    .local v10, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    const/16 v1, 0x26

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 166
    invoke-static {v10, v0}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 170
    const/16 v1, 0x26

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 171
    invoke-static {v10, v7}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQueryElement(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 173
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {v10, v1}, Lcom/ning/http/util/StringUtils;->charSequence2ByteBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 174
    .local v8, "rawBase":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->mac:Lcom/ning/http/client/oauth/ThreadSafeHMAC;

    invoke-virtual {v1, v8}, Lcom/ning/http/client/oauth/ThreadSafeHMAC;->digest(Ljava/nio/ByteBuffer;)[B

    move-result-object v9

    .line 176
    .local v9, "rawSignature":[B
    invoke-static {v9}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected generateNonce()Ljava/lang/String;
    .locals 2

    .prologue
    .line 210
    sget-object v1, Lcom/ning/http/client/oauth/OAuthSignatureCalculator;->NONCE_BUFFER:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 211
    .local v0, "nonceBuffer":[B
    invoke-static {}, Ljava/util/concurrent/ThreadLocalRandom;->current()Ljava/util/concurrent/ThreadLocalRandom;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ThreadLocalRandom;->nextBytes([B)V

    .line 213
    invoke-static {v0}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected generateTimestamp()J
    .locals 4

    .prologue
    .line 206
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method
