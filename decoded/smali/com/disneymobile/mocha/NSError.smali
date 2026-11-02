.class public Lcom/disneymobile/mocha/NSError;
.super Ljava/lang/Object;
.source "NSError.java"


# instance fields
.field private code:I

.field private domain:Ljava/lang/String;

.field private userInfo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;
    .locals 1
    .param p0, "domain"    # Ljava/lang/String;
    .param p1, "code"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/mocha/NSError;"
        }
    .end annotation

    .prologue
    .line 14
    .local p2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/disneymobile/mocha/NSError;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSError;-><init>()V

    invoke-virtual {v0, p0, p1, p2}, Lcom/disneymobile/mocha/NSError;->initWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v0

    return-object v0
.end method

.method public static errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;
    .locals 4
    .param p0, "e"    # Ljava/lang/Exception;

    .prologue
    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 19
    .local v0, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "kNSErrorExceptionKey"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    new-instance v1, Lcom/disneymobile/mocha/NSError;

    invoke-direct {v1}, Lcom/disneymobile/mocha/NSError;-><init>()V

    const-string v2, "kNSErrorJavaExceptionDomain"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lcom/disneymobile/mocha/NSError;->initWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSError;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCode()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/disneymobile/mocha/NSError;->code:I

    return v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disneymobile/mocha/NSError;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public getUserInfo()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/disneymobile/mocha/NSError;->userInfo:Ljava/util/HashMap;

    return-object v0
.end method

.method public initWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;
    .locals 0
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "code"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/disneymobile/mocha/NSError;"
        }
    .end annotation

    .prologue
    .line 27
    .local p3, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/disneymobile/mocha/NSError;->domain:Ljava/lang/String;

    .line 28
    iput p2, p0, Lcom/disneymobile/mocha/NSError;->code:I

    .line 29
    iput-object p3, p0, Lcom/disneymobile/mocha/NSError;->userInfo:Ljava/util/HashMap;

    .line 30
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NSError "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disneymobile/mocha/NSError;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/disneymobile/mocha/NSError;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disneymobile/mocha/NSError;->userInfo:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
