package ca.jrvs.apps.grep;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.log4j.BasicConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JavaGrepImp implements JavaGrep {

  final Logger logger = LoggerFactory.getLogger(JavaGrep.class);
  private String regex;
  private String rootPath;
  private String outFile;

  public static void main(String[] args) throws IOException {

    if(args.length!=3){

      throw new IllegalArgumentException("USAGE: JavaGrep regex rootPath outfile");
    }
    BasicConfigurator.configure(); //Use default logger config
    JavaGrepImp javaGrepImp = new JavaGrepImp();

    //Store the arguments
    javaGrepImp.setRegex(args[0]);
    javaGrepImp.setRootPath(args[1]);
    javaGrepImp.setOutFile(args[2]);
    javaGrepImp.process();

    try {
      javaGrepImp.process();
    }
    catch (Exception message){
      javaGrepImp.logger.error("Unable to Process",message);
    }
  }

  @Override
  public void process() throws IOException {
    List <String> lineMatched =new ArrayList<>();
    /* for (int i =0;i<ArrayList.length;i++) */
    try{
      for (File file :listFiles(getRootPath())) {
        for (String lines : readLines(file)) {
          if (containsPattern(lines)) {
            lineMatched.add(lines);
          }
          this.writeToFile(lineMatched);
        }
      }
    }catch (IOException message){
      logger.error("Unable to Process",message);
    }
  }

  public List <String> readLines(File file) {
    List <String> lines =new ArrayList<>();
    try {
      BufferedReader bReader;
      String line;
      bReader = new BufferedReader(new FileReader(file));
      line = bReader.readLine();
      lines.add(line);
      bReader.close();
    }catch (FileNotFoundException message){

      logger.error("The file not found",message);

    } catch (IOException message) {
      logger.error("Unable to Process",message);
    }
    return lines;
  }

  @Override
  public List<File> listFiles(String rootDir) {

    File file = new File(rootDir);
    return new ArrayList<>(Arrays.asList(file.listFiles()));
  }

  @Override
  public boolean containsPattern(String line) {
    return line.matches(regex);
  }

  @Override
  public void writeToFile(List<String> lines) throws IOException {
    File fileOut = new File(outFile);
    FileOutputStream fileStream = new FileOutputStream(fileOut);

    BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(fileStream));
    for (String temp: lines) {
      try {
        bufferedWriter.write(temp);
        bufferedWriter.newLine();
      }catch (IOException message) {
        logger.error("Unable to Write to the File.",message);
      }
    } bufferedWriter.close();
  }

  @Override
  public String getRootPath() {
    return rootPath;
  }

  @Override
  public  void setRootPath(String getRootPath) {
    this.rootPath=getRootPath;
  }

  @Override
  public String getRegex() {
    return regex;
  }

  @Override
  public void setRegex(String regex) {
    this.regex=regex;
  }

  @Override
  public String getOutFile() {
    return outFile;
  }

  @Override
  public  void setOutFile(String outfile) {
    this.outFile=outfile;
  }

}