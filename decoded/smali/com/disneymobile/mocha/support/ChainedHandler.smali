.class public Lcom/disneymobile/mocha/support/ChainedHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ChainedHandler.java"


# instance fields
.field public mAttrs:Lorg/xml/sax/Attributes;

.field public mHandling:Ljava/lang/String;

.field public mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

.field public mReader:Lorg/xml/sax/XMLReader;

.field public mTag:Ljava/lang/String;

.field public mText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 72
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 59
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    .line 60
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    .line 61
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mAttrs:Lorg/xml/sax/Attributes;

    .line 62
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mHandling:Ljava/lang/String;

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mTag:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public constructor <init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V
    .locals 1
    .param p1, "aParent"    # Lcom/disneymobile/mocha/support/ChainedHandler;

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 59
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    .line 60
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    .line 61
    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mAttrs:Lorg/xml/sax/Attributes;

    .line 62
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mHandling:Ljava/lang/String;

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mTag:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    .line 92
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    .line 93
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/ChainedHandler;->getReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/support/ChainedHandler;->setReader(Lorg/xml/sax/XMLReader;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 0
    .param p1, "aReader"    # Lorg/xml/sax/XMLReader;

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/disneymobile/mocha/support/ChainedHandler;-><init>()V

    .line 82
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    .line 83
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 4
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 196
    const-string v1, "\n\t\r"

    .line 197
    .local v1, "lSpecialCharacters":Ljava/lang/String;
    move v0, p2

    .local v0, "i":I
    :goto_0
    add-int v2, p2, p3

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1

    .line 199
    aget-char v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_0

    .line 201
    const/16 v2, 0x20

    aput-char v2, p1, v0

    .line 197
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 204
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    .line 205
    return-void
.end method

.method public getAttributes()Lorg/xml/sax/Attributes;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mAttrs:Lorg/xml/sax/Attributes;

    return-object v0
.end method

.method public getReader()Lorg/xml/sax/XMLReader;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "aName"    # Ljava/lang/String;
    .param p2, "aObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 145
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".setAttribute("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") must be overridden!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public setAttribute(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "aName"    # Ljava/lang/String;
    .param p2, "aObjects"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 155
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".setAttribute("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") must be overridden!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public setParent(Lcom/disneymobile/mocha/support/ChainedHandler;)V
    .locals 1
    .param p1, "aParent"    # Lcom/disneymobile/mocha/support/ChainedHandler;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    .line 167
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/ChainedHandler;->getReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/support/ChainedHandler;->setReader(Lorg/xml/sax/XMLReader;)V

    .line 168
    return-void
.end method

.method public setReader(Lorg/xml/sax/XMLReader;)V
    .locals 0
    .param p1, "aReader"    # Lorg/xml/sax/XMLReader;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "aURI"    # Ljava/lang/String;
    .param p2, "aName"    # Ljava/lang/String;
    .param p3, "aQName"    # Ljava/lang/String;
    .param p4, "aAttrs"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 183
    iput-object p2, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mTag:Ljava/lang/String;

    .line 185
    new-instance v0, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v0, p4}, Lorg/xml/sax/helpers/AttributesImpl;-><init>(Lorg/xml/sax/Attributes;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mAttrs:Lorg/xml/sax/Attributes;

    .line 186
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    .line 187
    return-void
.end method

.method public startHandlingEvents()V
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 107
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 108
    return-void
.end method

.method public startHandlingEvents(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "aName"    # Ljava/lang/String;
    .param p2, "aAttrs"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 121
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mHandling:Ljava/lang/String;

    .line 122
    iput-object p1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mTag:Ljava/lang/String;

    .line 123
    new-instance v0, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v0, p2}, Lorg/xml/sax/helpers/AttributesImpl;-><init>(Lorg/xml/sax/Attributes;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mAttrs:Lorg/xml/sax/Attributes;

    .line 124
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mText:Ljava/lang/String;

    .line 125
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/ChainedHandler;->startHandlingEvents()V

    .line 126
    return-void
.end method

.method public stopHandlingEvents()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    iget-object v1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 135
    iget-object v0, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mReader:Lorg/xml/sax/XMLReader;

    iget-object v1, p0, Lcom/disneymobile/mocha/support/ChainedHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 136
    return-void
.end method
