.class public Lcom/ning/http/client/generators/InputStreamBodyGenerator;
.super Ljava/lang/Object;
.source "InputStreamBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/BodyGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;
    }
.end annotation


# static fields
.field private static final END_PADDING:[B

.field private static final ZERO:[B

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final inputStream:Ljava/io/InputStream;

.field private patchNettyChunkingIssue:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->END_PADDING:[B

    .line 36
    const-string v0, "0"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->ZERO:[B

    .line 38
    const-class v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->patchNettyChunkingIssue:Z

    .line 42
    iput-object p1, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->inputStream:Ljava/io/InputStream;

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)Ljava/io/InputStream;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$100()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->logger:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->patchNettyChunkingIssue:Z

    return v0
.end method

.method static synthetic access$300()[B
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->ZERO:[B

    return-object v0
.end method

.method static synthetic access$400()[B
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->END_PADDING:[B

    return-object v0
.end method


# virtual methods
.method public createBody()Lcom/ning/http/client/Body;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;

    invoke-direct {v0, p0}, Lcom/ning/http/client/generators/InputStreamBodyGenerator$ISBody;-><init>(Lcom/ning/http/client/generators/InputStreamBodyGenerator;)V

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public patchNettyChunkingIssue(Z)V
    .locals 0
    .param p1, "patchNettyChunkingIssue"    # Z

    .prologue
    .line 129
    iput-boolean p1, p0, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->patchNettyChunkingIssue:Z

    .line 130
    return-void
.end method
