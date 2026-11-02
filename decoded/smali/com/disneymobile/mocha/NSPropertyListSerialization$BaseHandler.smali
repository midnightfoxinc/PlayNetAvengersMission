.class abstract Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;
.super Lcom/disneymobile/mocha/support/ChainedHandler;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "BaseHandler"
.end annotation


# direct methods
.method public constructor <init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V
    .locals 0
    .param p1, "parent"    # Lcom/disneymobile/mocha/support/ChainedHandler;

    .prologue
    .line 282
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/support/ChainedHandler;-><init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V

    .line 283
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 0
    .param p1, "reader"    # Lorg/xml/sax/XMLReader;

    .prologue
    .line 278
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/support/ChainedHandler;-><init>(Lorg/xml/sax/XMLReader;)V

    .line 279
    return-void
.end method


# virtual methods
.method public abstract addChild(Ljava/lang/Object;)V
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 303
    const-string v0, "NSPropertyListSerialization.BaseHandler"

    const-string v1, "parse error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 304
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 308
    const-string v0, "NSPropertyListSerialization.BaseHandler"

    const-string v1, "parse fatal error"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 309
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attr"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 287
    const-string v0, "dict"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;-><init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;->startHandlingEvents()V

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 289
    :cond_1
    const-string v0, "array"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 290
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;-><init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V

    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->startHandlingEvents()V

    goto :goto_0
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 298
    const-string v0, "NSPropertyListSerialization.BaseHandler"

    const-string v1, "parse warning"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 299
    return-void
.end method
