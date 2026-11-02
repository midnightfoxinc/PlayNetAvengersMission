.class final Lcom/disneymobile/mocha/NSPropertyListSerialization$1;
.super Ljava/io/InputStream;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithDataOptionsFormatAndError(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private final inputStream:Ljava/io/InputStream;

.field private skippingLeadingWhitespace:Z

.field final synthetic val$data:Lcom/disneymobile/mocha/NSData;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/NSData;)V
    .locals 1

    .prologue
    .line 57
    iput-object p1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->val$data:Lcom/disneymobile/mocha/NSData;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->skippingLeadingWhitespace:Z

    .line 59
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->val$data:Lcom/disneymobile/mocha/NSData;

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSData;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->inputStream:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    iget-boolean v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->skippingLeadingWhitespace:Z

    if-eqz v1, :cond_1

    .line 65
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 66
    .local v0, "dataByte":I
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 67
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->skippingLeadingWhitespace:Z

    .line 70
    .end local v0    # "dataByte":I
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0
.end method
