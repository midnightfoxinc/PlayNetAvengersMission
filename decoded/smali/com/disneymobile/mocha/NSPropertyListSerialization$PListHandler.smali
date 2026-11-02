.class Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;
.super Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PListHandler"
.end annotation


# instance fields
.field protected plist:Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;


# direct methods
.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 1
    .param p1, "reader"    # Lorg/xml/sax/XMLReader;

    .prologue
    .line 316
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;-><init>(Lorg/xml/sax/XMLReader;)V

    .line 313
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;->plist:Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;

    .line 317
    return-void
.end method


# virtual methods
.method public addChild(Ljava/lang/Object;)V
    .locals 1
    .param p1, "child"    # Ljava/lang/Object;

    .prologue
    .line 331
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;->plist:Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;

    iput-object p1, v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;->root:Ljava/lang/Object;

    .line 332
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attr"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 321
    invoke-super {p0, p1, p2, p3, p4}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 324
    const-string v0, "plist"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;-><init>(Lcom/disneymobile/mocha/NSPropertyListSerialization$1;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;->plist:Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;

    .line 327
    :cond_0
    return-void
.end method
