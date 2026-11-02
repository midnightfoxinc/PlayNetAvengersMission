.class public Lcom/disneymobile/mocha/NSPropertyListSerialization;
.super Ljava/lang/Object;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$Dict;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$DictHandler;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;,
        Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    }
.end annotation


# static fields
.field public static final NSPropertyListImmutable:Ljava/lang/String; = ""

.field public static final NSPropertyListXMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    sput-object v0, Lcom/disneymobile/mocha/NSPropertyListSerialization;->NSPropertyListXMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 575
    return-void
.end method

.method public static dataWithPropertyListFormatOptionsAndError(Ljava/lang/Object;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;
    .locals 4
    .param p0, "plist"    # Ljava/lang/Object;
    .param p1, "format"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .param p2, "options"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Lcom/disneymobile/mocha/NSData;"
        }
    .end annotation

    .prologue
    .line 115
    .local p3, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    invoke-static {p0, p1, p2, p3}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->stringWithPropertyListFormatOptionsAndError(Ljava/lang/Object;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/String;

    move-result-object v2

    .line 117
    .local v2, "string":Ljava/lang/String;
    :try_start_0
    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 122
    :goto_0
    return-object v1

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    if-eqz p3, :cond_0

    .line 121
    invoke-static {v0}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    invoke-virtual {p3, v3}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 122
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static propertyListWithDataOptionsFormatAndError(Lcom/disneymobile/mocha/NSData;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
    .locals 3
    .param p0, "data"    # Lcom/disneymobile/mocha/NSData;
    .param p1, "options"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    .param p2, "format"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/NSData;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 54
    .local p3, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    if-nez p0, :cond_0

    .line 55
    const/4 v0, 0x0

    .line 56
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;

    invoke-direct {v1, p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$1;-><init>(Lcom/disneymobile/mocha/NSData;)V

    const/16 v2, 0x2000

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-static {v0, p1, p2, p3}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithStreamOptionsFormatAndError(Ljava/io/InputStream;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public static propertyListWithStreamOptionsFormatAndError(Ljava/io/InputStream;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
    .locals 8
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "options"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    .param p2, "format"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p3, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v6, 0x0

    .line 83
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    .line 84
    .local v3, "parserFactory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 85
    .local v2, "parser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 94
    .local v4, "reader":Lorg/xml/sax/XMLReader;
    new-instance v5, Lorg/xml/sax/InputSource;

    invoke-direct {v5, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 95
    .local v5, "source":Lorg/xml/sax/InputSource;
    new-instance v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;

    invoke-direct {v1, v4}, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;-><init>(Lorg/xml/sax/XMLReader;)V

    .line 97
    .local v1, "handler":Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;
    invoke-interface {v4, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 98
    invoke-interface {v4, v1}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 100
    :try_start_1
    invoke-interface {v4, v5}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_3

    .line 111
    iget-object v6, v1, Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;->plist:Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$PList;->root:Ljava/lang/Object;

    :cond_0
    :goto_0
    return-object v6

    .line 86
    .end local v1    # "handler":Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;
    .end local v2    # "parser":Ljavax/xml/parsers/SAXParser;
    .end local v3    # "parserFactory":Ljavax/xml/parsers/SAXParserFactory;
    .end local v4    # "reader":Lorg/xml/sax/XMLReader;
    .end local v5    # "source":Lorg/xml/sax/InputSource;
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Lorg/xml/sax/SAXException;
    const-string v6, "NSPropertyListSerialization"

    const-string v7, "Unable to create default XML reader"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 88
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "Unable to create default XML reader"

    invoke-direct {v6, v7, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 89
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v0

    .line 90
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    const-string v6, "NSPropertyListSerialization"

    const-string v7, "Unable to create default XML reader"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "Unable to create default XML reader"

    invoke-direct {v6, v7, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 101
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .restart local v1    # "handler":Lcom/disneymobile/mocha/NSPropertyListSerialization$PListHandler;
    .restart local v2    # "parser":Ljavax/xml/parsers/SAXParser;
    .restart local v3    # "parserFactory":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v4    # "reader":Lorg/xml/sax/XMLReader;
    .restart local v5    # "source":Lorg/xml/sax/InputSource;
    :catch_2
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/IOException;
    if-eqz p3, :cond_0

    .line 103
    invoke-static {v0}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v7

    invoke-virtual {p3, v7}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    goto :goto_0

    .line 105
    .end local v0    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 106
    .local v0, "e":Lorg/xml/sax/SAXException;
    if-eqz p3, :cond_0

    .line 107
    invoke-static {v0}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v7

    invoke-virtual {p3, v7}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static propertyListWithStringOptionsFormatAndError(Ljava/lang/String;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;
    .locals 2
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "options"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;
    .param p2, "format"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 77
    .local p3, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0, p1, p2, p3}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithStreamOptionsFormatAndError(Ljava/io/InputStream;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static stringWithPropertyListFormatOptionsAndError(Ljava/lang/Object;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/String;
    .locals 2
    .param p0, "plist"    # Ljava/lang/Object;
    .param p1, "format"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;
    .param p2, "options"    # Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;",
            "Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 127
    .local p3, "error":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 128
    .local v0, "writer":Ljava/io/StringWriter;
    invoke-static {v0, p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writePropertyList(Ljava/io/Writer;Ljava/lang/Object;)V

    .line 129
    if-eqz p3, :cond_0

    .line 130
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 131
    :cond_0
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static writeArray(Ljava/io/Writer;Ljava/util/ArrayList;)V
    .locals 3
    .param p0, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/Writer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    .local p1, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string v2, "<array>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 199
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 200
    .local v0, "element":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 201
    invoke-static {p0, v0}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeElement(Ljava/io/Writer;Ljava/lang/Object;)V

    goto :goto_0

    .line 204
    .end local v0    # "element":Ljava/lang/Object;
    :cond_1
    const-string v2, "</array>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method private static writeBoolean(Ljava/io/Writer;Ljava/lang/Boolean;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "bool"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    if-eqz p1, :cond_0

    .line 245
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "<true/>"

    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 246
    :cond_0
    return-void

    .line 245
    :cond_1
    const-string v0, "<false/>"

    goto :goto_0
.end method

.method private static writeData(Ljava/io/Writer;Lcom/disneymobile/mocha/NSData;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "data"    # Lcom/disneymobile/mocha/NSData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    const-string v1, "<data>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 226
    if-eqz p1, :cond_0

    .line 227
    invoke-virtual {p1}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v1

    new-array v0, v1, [B

    .line 228
    .local v0, "dataBytes":[B
    array-length v1, v0

    invoke-virtual {p1, v0, v1}, Lcom/disneymobile/mocha/NSData;->getBytesLength([BI)Lcom/disneymobile/mocha/NSError;

    .line 229
    invoke-static {v0}, Lcom/disneymobile/mocha/support/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write([C)V

    .line 231
    .end local v0    # "dataBytes":[B
    :cond_0
    const-string v1, "</data>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method private static writeData(Ljava/io/Writer;Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    const-string v1, "<data>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 216
    if-eqz p1, :cond_0

    .line 217
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    new-array v0, v1, [B

    .line 218
    .local v0, "dest":[B
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 219
    invoke-static {v0}, Lcom/disneymobile/mocha/support/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write([C)V

    .line 221
    .end local v0    # "dest":[B
    :cond_0
    const-string v1, "</data>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 222
    return-void
.end method

.method private static writeDate(Ljava/io/Writer;Ljava/util/Date;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "date"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    const-string v1, "<date>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 236
    if-eqz p1, :cond_0

    .line 237
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZ"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 238
    .local v0, "format":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 240
    .end local v0    # "format":Ljava/text/SimpleDateFormat;
    :cond_0
    const-string v1, "</date>"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 241
    return-void
.end method

.method private static writeDict(Ljava/io/Writer;Ljava/util/HashMap;)V
    .locals 3
    .param p0, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/Writer;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "<dict>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 186
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 187
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 188
    const-string v2, "<key>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 189
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 190
    const-string v2, "</key>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 191
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeElement(Ljava/io/Writer;Ljava/lang/Object;)V

    goto :goto_0

    .line 194
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    const-string v2, "</dict>"

    invoke-virtual {p0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method private static writeDouble(Ljava/io/Writer;Ljava/lang/Double;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "real"    # Ljava/lang/Double;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    const-string v0, "<real>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 257
    if-eqz p1, :cond_0

    .line 258
    invoke-virtual {p1}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 259
    :cond_0
    const-string v0, "</real>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 260
    return-void
.end method

.method private static writeElement(Ljava/io/Writer;Ljava/lang/Object;)V
    .locals 3
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    if-eqz p1, :cond_0

    .line 156
    instance-of v0, p1, Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 157
    check-cast p1, Ljava/util/HashMap;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeDict(Ljava/io/Writer;Ljava/util/HashMap;)V

    .line 182
    :cond_0
    :goto_0
    return-void

    .line 158
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_1
    const-class v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 159
    check-cast p1, Ljava/util/ArrayList;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeArray(Ljava/io/Writer;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 160
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_2
    const-class v0, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 161
    check-cast p1, Ljava/lang/String;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeString(Ljava/io/Writer;Ljava/lang/String;)V

    goto :goto_0

    .line 162
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_3
    const-class v0, Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 163
    check-cast p1, Ljava/nio/ByteBuffer;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeData(Ljava/io/Writer;Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 164
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_4
    const-class v0, Lcom/disneymobile/mocha/NSData;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 165
    check-cast p1, Lcom/disneymobile/mocha/NSData;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeData(Ljava/io/Writer;Lcom/disneymobile/mocha/NSData;)V

    goto :goto_0

    .line 166
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_5
    const-class v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 167
    check-cast p1, Ljava/util/Date;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeDate(Ljava/io/Writer;Ljava/util/Date;)V

    goto :goto_0

    .line 168
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_6
    const-class v0, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 169
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeBoolean(Ljava/io/Writer;Ljava/lang/Boolean;)V

    goto :goto_0

    .line 170
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_7
    const-class v0, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 171
    check-cast p1, Ljava/lang/Float;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeFloat(Ljava/io/Writer;Ljava/lang/Float;)V

    goto :goto_0

    .line 172
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_8
    const-class v0, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 173
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeDouble(Ljava/io/Writer;Ljava/lang/Double;)V

    goto/16 :goto_0

    .line 174
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_9
    const-class v0, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 175
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeInteger(Ljava/io/Writer;Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 176
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_a
    const-class v0, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 177
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeLong(Ljava/io/Writer;Ljava/lang/Long;)V

    goto/16 :goto_0

    .line 179
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempt to serialize a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to an NSPropertyList"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static writeFloat(Ljava/io/Writer;Ljava/lang/Float;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "real"    # Ljava/lang/Float;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    const-string v0, "<real>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 250
    if-eqz p1, :cond_0

    .line 251
    invoke-virtual {p1}, Ljava/lang/Float;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 252
    :cond_0
    const-string v0, "</real>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method private static writeInteger(Ljava/io/Writer;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "integer"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    const-string v0, "<integer>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 264
    if-eqz p1, :cond_0

    .line 265
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 266
    :cond_0
    const-string v0, "</integer>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method private static writeLong(Ljava/io/Writer;Ljava/lang/Long;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "integer"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    const-string v0, "<integer>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 271
    if-eqz p1, :cond_0

    .line 272
    invoke-virtual {p1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 273
    :cond_0
    const-string v0, "</integer>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 274
    return-void
.end method

.method private static writePropertyList(Ljava/io/Writer;Ljava/lang/Object;)V
    .locals 3
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "root"    # Ljava/lang/Object;

    .prologue
    .line 138
    :try_start_0
    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\r"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 139
    const-string v1, "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n\r"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 140
    const-string v1, "<plist version=\"1.0\">"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 141
    invoke-static {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->writeElement(Ljava/io/Writer;Ljava/lang/Object;)V

    .line 142
    const-string v1, "</plist>\n\r"

    invoke-virtual {p0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 151
    return-void

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v1, "NSPropertyListSerialization"

    const-string v2, "IO System is reporting that UTF-8 is not supported.  This is unlikely."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 146
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "IO System is reporting that UTF-8 is not supported.  This is unlikely."

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 147
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 148
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "NSPropertyListSerialization"

    const-string v2, "Unable to write into the byte array"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 149
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unable to write into the byte array"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static writeString(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    const-string v0, "<string>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 209
    if-eqz p1, :cond_0

    .line 210
    invoke-static {p1}, Landroid/text/TextUtils;->htmlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 211
    :cond_0
    const-string v0, "</string>"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 212
    return-void
.end method
