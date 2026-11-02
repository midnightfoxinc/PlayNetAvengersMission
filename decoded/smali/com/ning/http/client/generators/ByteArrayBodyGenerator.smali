.class public Lcom/ning/http/client/generators/ByteArrayBodyGenerator;
.super Ljava/lang/Object;
.source "ByteArrayBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/BodyGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;
    }
.end annotation


# instance fields
.field private final bytes:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->bytes:[B

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)[B
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/generators/ByteArrayBodyGenerator;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator;->bytes:[B

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
    .line 69
    new-instance v0, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;

    invoke-direct {v0, p0}, Lcom/ning/http/client/generators/ByteArrayBodyGenerator$ByteBody;-><init>(Lcom/ning/http/client/generators/ByteArrayBodyGenerator;)V

    return-object v0
.end method
